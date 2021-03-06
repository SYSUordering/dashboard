# REST API设计规范

## 1.RESTful架构

1. 每一个URI代表一种资源
2. 客户端和服务器之间，传递这种资源的某种表现层
3. 客户端通过四个HTTP动词，对服务器端进行资源操作，首先表层状态转化


## 2.协议
1. 采用HTTP协议

## 3.REST接口规范

1. 动作
    1. GET(SELECT): 从服务器检索特定资源，或资源列表
    2. POST(CREATE): 在服务器上创建一个新的资源
    3. PUT(UPDATE): 更新服务器上的资源，提供整个资源。
    4. PUT(UPDATE): 更新服务器上的资源，提供整个资源。
    5. DELETE(DELETE): 从服务器删除资源。

2. 路径
    1. 该架构中，每种网址代表一种资源，所以网址中不能有动词，只能有名词，所用名词与数据库的表哥名相对应。所有接口都用名词表示，不用动词。下面为举例
        1.POST/session:提交会话
        2.GET/session:获取会话
        3.DELETE/menu/dish:删除菜品
        4.PUT/restaurant:更新饭店信息
        5.POST/menu/category:更新种类

3. 版本

API 的版本如下：<https://zhidan-system.github.io/API/swagger-ui/#/Restaurant>

4. 过滤信息
因为有些记录信息很多，服务器不会将所有记录返回给用户。API提供参数，过滤用户不想要的结果。例子如下：

orders?customer_id = 1: 指定返回的用户订单信息

5. 状态码
- 状态码范围：
    1. 1XX 信息，请求收到，继续处理。范围保留用于底层HTTP的东西。
    2. 2XX 成功，行为被成功地接受，理解和采纳。
    3. 3XX 重定向，为了完成请求，必须进一步执行的动作。
    4. 客户端错误，请求包含语法错误或者请求无法实现。范围保留用于响应客户端做出的错误。
    5. 围的状态码时保留给服务器错误用的。
- 服务器返回资源的同时会向用户返回状态码和提示信息，状态码设计如下：
    1. 200 OK - [GET]: 服务器成功返回用户请求的数据，该操作是幂等的(Idempotent)。
    2. 201 CREATED [POST/PUT/PATCH]: 用户新建或修改数据成功
    3. 202 Accepted - [*]: 表示一个请求已经进入后台排队（异步任务）。
    4. 204 NO CONTENT - [DELETE]:用户删除数据成功。
    5. 400 INVALID REQUEST - [POST/PUT/PATCH]: 用户发出的请求有错误，服务器没有进行新建或修改数据的操作。
    6. 401 Unauthorized - [*]: 表示用户没有权限（令牌，用户名或密码错误）。
    7. 403 Forbidden - [*]: 表示用户得到授权，但是访问被禁止。
    8. 404 NOT FOUND - [*]: 用户发出的请求针对的是不存在的记录，服务器没有进行操作，该操作是幂等的。
    9. 406 Not Acceptable - [GET]: 用户请求的格式不可得。
    10. 410 Gone - [GET]: 用户请求的资源被永久删除，且不会再得到。
    11. 422 Unprocesable entity - [POST/PUT/PATCH]: 当创建一个对象时，发生一个验证错误。
    12. 500 INTERNAL SERVER ERROR - [*]: 服务器发生错误，用户无法判断发出的请求是否成功。

6. 错误处理

如果状态码是4XX，会向用户返回出错信息。出错信息中将error作为键名，出错信息座位键值。

7. 返回结果

```
{
    "code":200,
    "msg":"成功",
    "data":{
        "id":1,
        "name":"zhangchen"
    }
}
```
各HTTP方法成功处理后的数据格式： |方法|response格式| |:-:|:----------:| |GET|单个对象，集合| |POST|新增成功的对象| |PUT/PATCH|更新成功的对象| |DELETE|空|

8. json格式：
    1. 时间用长rfc3339标准定义时间格式，客户端需要自己按需转化。
    2. 某些数据库表属性为空的字段对应的json字段可以留空

