<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/4/7
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-md-3">
        <div class="form-group">
            <label for="minPrice">最小价格：</label>
            <input type="number" class="form-control" id="minPrice" name="minPrice">
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <label for="maxPrice">最大价格：</label>
            <input type="number" class="form-control" id="maxPrice" name="maxPrice">
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <label for="payMethod">支付方式：</label>
            <select class="form-control" id="payMethod" name="payMethod">
                <option value="">请选择</option>
                <option value="wechat">微信</option>
                <option value="alipay">支付宝</option>
            </select>
        </div>
    </div>
    <div class="col-md-3">
        <button type="submit" class="btn btn-primary">查询</button>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label for="username">下单用户：</label>
            <input type="text" class="form-control" id="username" name="username">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="startTime">起始时间：</label>
            <input type="text" class="form-control" id="startTime" name="startTime" placeholder="YYYY-MM-DD">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="endTime">截止时间：</label>
            <input type="text" class="form-control" id="endTime" name="endTime" placeholder="YYYY-MM-DD">
        </div>
    </div>
</div>
</body>
</html>
