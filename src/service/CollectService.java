package service;

import dao.CollectDao;

import model.Collect;

import java.util.List;

public class CollectService {
    CollectDao collectDao = new CollectDao();

    public int insertCollect(Collect collect){
        return collectDao.insertCollect(collect);
    }
    // 调整收藏商品数量

    public int editCollect(Collect collect){
        return collectDao.editCollect(collect);
    }

    // 查询收藏数量
    public int queryCollectAmount(int userId){
        return collectDao.queryCollectAmount(userId);
    }
    // 查询收藏
    public List<Collect> queryCollectList (Collect collect){
        return collectDao.queryCollectList(collect);
    }

    // 根据商品ID查询
    public Collect queryCollectByGoodsId (Collect c){
        return collectDao.queryCollectByGoodsId(c);
    }
    // 删除收藏中的商品
    public int deleteCollect(Collect collect){
        return collectDao.deleteCollect(collect);
    }
    // 添加收藏
    public int collectBuy(Collect collect){
        int result = 0;
        Collect c = collectDao.queryCollectByGoodsId(collect);
        if(c != null){ // 如果该商品在购物车已存在，则商品数量加1
            collect.setId(c.getId());
            result =collectDao.editCollect(collect);
        }else{
            // 如果该商品在购物车中不存在，则创建该商品
            result = collectDao.insertCollect(collect);
        }
        return result;
    }
    // 清空购物车
    public int deleteCollectAll(Collect collect){
        return collectDao.deleteCollectAll(collect);
    }
}
