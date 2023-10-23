package dao;


import model.Collect;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CollectDao {
    public int insertCollect(Collect collect){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "insert collect(goodsId,userId,amount) values(?,?,1)";
            result = runner.update(sql,collect.getGoodsId(),collect.getUserId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public int editCollect(Collect collect){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "update collect set amount=amount+"+collect.getAmount()+" where id=?";
            result = runner.update(sql,collect.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 查询收藏商品数量
    public int queryCollectAmount(int userId){
        int amount = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="SELECT IFNULL(SUM(amount),0) from collect where userId=?";
            amount = runner.query(sql,new ScalarHandler<BigDecimal>(),userId).intValue();

        }catch (Exception e){
            e.printStackTrace();
        }
        return amount;
    }

    // 查询收藏列表
    public List<Collect> queryCollectList (Collect collect){
        List<Collect> list = new ArrayList<Collect>();
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="SELECT a.*,b.`name`,b.`cover`,b.`price` FROM collect a  " +
                    "LEFT JOIN goods b ON a.`goodsId` = b.`id` WHERE userId = ? ORDER BY a.id DESC";
            list = runner.query(sql,new BeanListHandler<>(Collect.class),collect.getUserId());

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 根据商品ID查询
    public Collect queryCollectByGoodsId (Collect c){
        Collect collect = null;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql ="select * from collect where userId = ? and goodsId = ?";
            collect = runner.query(sql,new BeanHandler<>(Collect.class),c.getUserId(),c.getGoodsId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return collect;
    }

    // 删除购物车中的商品
    public int deleteCollect(Collect collect){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "delete from collect where userId = ? and goodsId = ?";
            result = runner.update(sql,collect.getUserId(),collect.getGoodsId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 清空购物车
    public int deleteCollectAll(Collect collect){
        int result = 0;
        try{
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "delete from collect where userId = ?";
            result = runner.update(sql,collect.getUserId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
