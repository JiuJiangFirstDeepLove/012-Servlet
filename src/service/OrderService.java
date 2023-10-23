package service;

import dao.*;
import model.*;
import utils.*;

import java.sql.*;
import java.util.List;

public class OrderService {
    private OrderDao oDao = new OrderDao();
    CartDao cartDao = new CartDao();

    public void addOrder(Order order) {
        Connection con = null;
        try {
            con = DataSourceUtils.getConnection();
            con.setAutoCommit(false); // 开启事务

            // 查询购物车商品
            Cart cart = new Cart();
            cart.setUserId(order.getUser().getId());
            List<Cart> cartList = cartDao.queryCartList(cart);
            // 计算订单总金额
            float total =0;
            for (Cart c:cartList) {
                total+= c.getPrice()*c.getAmount();
            }
            order.setTotal(total);
            // 计算商品数量
            int amount = cartDao.queryCartAmount(order.getUser().getId());
            order.setAmount(amount);

            oDao.insertOrder(con, order);
            int id = oDao.getLastInsertId(con);
            order.setId(id);
            // 循环购物车列表，插入订单项
            for (Cart c:cartList) {
                OrderItem item = new OrderItem();
                item.setPrice(c.getPrice());
                item.setAmount(c.getAmount());
                Goods goods = new Goods();
                goods.setId(c.getGoodsId());
                item.setGoods(goods);
                Order order1 = new Order();
                order1.setId(id);
                item.setOrder(order1);
                oDao.insertOrderItem(con, item);
            }

            // 清空购物车
            cartDao.deleteCartAll(cart);

            con.commit(); // 提交事务
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            if(con!=null)
                try {
                    con.rollback(); // 回滚事务
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
        }
    }
    public List<Order> selectAll(int userid){
        List<Order> list=null;
        try {
            list = oDao.selectAll(userid);
            for(Order o :list) {
                List<OrderItem> l = oDao.selectAllItem(o.getId());
                o.setItemList(l);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    public Page getOrderPage(Order order,int pageNumber) {
        Page p = new Page();
        p.setPageNumber(pageNumber);
        int pageSize = 10;
        int totalCount = 0;
        try {
            totalCount = oDao.getOrderCount(order);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        p.SetPageSizeAndTotalCount(pageSize, totalCount);
        List list=null;
        try {
            list = oDao.selectOrderList(order, pageNumber, pageSize);
            for(Order o :(List<Order>)list) {
                List<OrderItem> l = oDao.selectAllItem(o.getId());
                o.setItemList(l);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        p.setList(list);
        return p;
    }
    public void updateStatus(int id,int status) {
        try {
            oDao.updateStatus(id, status);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void delete(int id) {
        Connection con = null;
        try {
            con = DataSourceUtils.getDataSource().getConnection();
            con.setAutoCommit(false);

            oDao.deleteOrderItem(con, id);
            oDao.deleteOrder(con, id);
            con.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            if(con!=null)
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
        }


    }
}
