package service;

import dao.CartDao;
import model.Cart;
import java.util.List;

public class CartService {
    CartDao cartDao = new CartDao();
    // 创建购物车
    public int insertCart(Cart cart){
        return cartDao.insertCart(cart);
    }

    // 调整购物车商品数量
    public int editCart(Cart cart){
        return cartDao.editCart(cart);
    }

    // 查询购物车数量
    public int queryCartAmount(int userId){
        return cartDao.queryCartAmount(userId);
    }
    // 查询购物车
    public List<Cart> queryCartList (Cart cart){
        return cartDao.queryCartList(cart);
    }

    // 根据商品ID查询
    public Cart queryCartByGoodsId (Cart c){
        return cartDao.queryCartByGoodsId(c);
    }
    // 删除购物车中的商品
    public int deleteCart(Cart cart){
        return cartDao.deleteCart(cart);
    }

    // 清空购物车
    public int deleteCartAll(Cart cart){
        return cartDao.deleteCartAll(cart);
    }

    // 添加商品
    public int cartBuy(Cart cart){
        int result = 0;
        Cart c = cartDao.queryCartByGoodsId(cart);
        if(c != null){ // 如果该商品在购物车已存在，则商品数量加1
            cart.setId(c.getId());
            cart.setAmount(1);
            result =cartDao.editCart(cart);
        }else{
            // 如果该商品在购物车中不存在，则创建该商品
            result = cartDao.insertCart(cart);
        }

        return result;
    }

    // 减少商品
    public int cartLessen(Cart cart){
        int result = 0;
        Cart c = cartDao.queryCartByGoodsId(cart);

        if(c != null){
            cart.setId(c.getId());
            // 如果该商品数量为1，就从购物车删除
            if(c.getAmount() == 1){
                result = cartDao.deleteCart(cart);
            }else{
                // 如果该商品数量大于1，数量减1
                cart.setAmount(-1);
                result =cartDao.editCart(cart);
            }

        }

        return result;
    }
}
