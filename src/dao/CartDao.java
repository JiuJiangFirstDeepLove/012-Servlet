package dao;

import model.Cart;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;

import java.math.BigDecimal;
import java.util.*;

public class CartDao {

    // 创建购物车
    public int insertCart(Cart cart){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "insert cart(goodsId,userId,amount) values(?,?,1)";
            result = runner.update(sql,cart.getGoodsId(),cart.getUserId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 调整购物车商品数量
    public int editCart(Cart cart){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "update cart set amount=amount+"+cart.getAmount()+" where id=?";
            result = runner.update(sql,cart.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 查询购物车商品数量
    public int queryCartAmount(int userId){
        int amount = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="SELECT IFNULL(SUM(amount),0) from cart where userId=?";
            amount = runner.query(sql,new ScalarHandler<BigDecimal>(),userId).intValue();

        }catch (Exception e){
            e.printStackTrace();
        }
        return amount;
    }

    // 查询购物车列表
    public List<Cart> queryCartList (Cart cart){
        List<Cart> list = new ArrayList<Cart>();
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="SELECT a.*,b.`name`,b.`cover`,b.`price` \n" +
                    "FROM cart a \n" +
                    "LEFT JOIN goods b ON a.`goodsId` = b.`id` \n" +
                    "WHERE userId = ?";
            list = runner.query(sql,new BeanListHandler<>(Cart.class),cart.getUserId());

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 根据商品ID查询
    public Cart queryCartByGoodsId (Cart c){
        Cart cart = null;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="select * from cart where userId = ? and goodsId = ?";
            cart = runner.query(sql,new BeanHandler<>(Cart.class),c.getUserId(),c.getGoodsId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return cart;
    }

    // 删除购物车中的商品
    public int deleteCart(Cart cart){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "delete from cart where userId = ? and goodsId = ?";
            result = runner.update(sql,cart.getUserId(),cart.getGoodsId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 清空购物车
    public int deleteCartAll(Cart cart){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "delete from cart where userId = ?";
            result = runner.update(sql,cart.getUserId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

}
