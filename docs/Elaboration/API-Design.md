# API设计说明



base url: http://zhidan.site:8080

## 1. 登录状态相关

> /api/v1/session: 
>
> 该API设计于管理session登录状态信息

### 1.1 登录餐厅账号（需要账号密码）

接口说明：

| 功能描述 | 使用账号密码第一次登录餐厅平台，创建登录会话 |
| -------- | -------------------------------------------- |
| 正式URL  | /api/v1/session                              |
| method   | POST                                         |
| 请求体   | 表单形式，见下表                             |
| 返回值   | JSON格式，见返回示例                         |

表单参数：

| 参数             | 类型   | 是否必须 | 示例值      | 描述                           |
| ---------------- | ------ | -------- | ----------- | ------------------------------ |
| manager_number   | string | 是       | 13128809302 | 可能发生重复，重复返回错误提示 |
| manager_password | string | 是       | password123 | 超过六位                       |

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 201    | Header: {Set-Cookie: 'sid=xxxxx'}<br />JSON: <br />{<br />  code: 201,<br />  msg: 'Session created',<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

### 1.2 更新&检查餐厅登录状态

接口说明：

| 功能描述 | 检查当前session的有效性，同时更新session的TTL |
| -------- | --------------------------------------------- |
| 正式URL  | /api/v1/session                               |
| method   | GET                                           |
| 请求体   | 无                                            |
| 返回值   | JSON格式，见返回示例                          |

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 200    | Header: {Set-Cookie: 'sid=xxxxx'}<br />JSON: {<br />  code: 200,<br />  msg: 'Session updated',<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Not login',<br />}    |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

### 1.3 登出餐厅账号

接口说明：

| 功能描述 | 删除登录会话状态     |
| -------- | -------------------- |
| 正式URL  | /api/v1/session      |
| method   | DELETE               |
| 请求体   | 表单形式，见下表     |
| 返回值   | JSON格式，见返回示例 |

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 200    | JSON: <br />{<br />  code: 200,<br />  msg: 'Session deleted',<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |



## 2. 餐厅相关

### 2.1 注册餐厅

接口说明：

| 功能描述    | 注册餐厅账户       |
| ----------- | ------------------ |
| URL正式描述 | /api/v1/restaurant |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 201    | JSON: <br />{<br />  code: 201,<br />  msg: 'Restaurant created',<br />  data: {<br />    restaurant_id: xxx,<br />    manager_number: xxx,<br />    restaurant_name: xxx,<br />    restuarant_number: xxx,<br />    image_id: xxx, <br />    description: xxx,<br />    categories: [<br />      {category_id: xxx1,  name: xxx1},<br />      {category_id: xxx2,  name: xxx2}<br />    ]<br />  }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |



### 2.2 获取餐厅信息


接口说明：

| 功能描述    | 获取餐厅基本信息   |
| ----------- | ------------------ |
| URL正式描述 | /api/v1/restaurant |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 200    | JSON: <br />{<br />  code: 200,<br />  msg: 'Get successfully',<br />  data: {<br />    restaurant_id: xxx,<br />    manager_number: xxx,<br />    restaurant_name: xxx,<br />    restuarant_number: xxx,<br />    image_id: xxx, <br />    description: xxx,<br />    categories: [<br />      {category_id: xxx1,  name: xxx1},<br />      {category_id: xxx2,  name: xxx2}<br />    ],<br />    desks: [<br />      {desk_id: xxx1, desk_link: xxx1, desk_number: xxx1},<br />      {desk_id: xxx2, desk_link: xxx2, desk_number: xxx2},<br />      {desk_id: xxx3, desk_link: xxx3, desk_number: xxx3},<br />    ]<br />  }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |



### 2.3 创建餐桌

接口说明：

| 功能描述    | 注册餐厅账户            |
| ----------- | ----------------------- |
| URL正式描述 | /api/v1/restaurant/desk |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 201    | JSON: <br />{<br />  code: 201,<br />  msg: 'Desk created',<br />  data: {<br />    desk_id: xxx,<br />    desk_link: xxx,<br />    restaurant_id: xxx,<br />    desk_number: xxx,<br />  }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

## 3. 菜单相关

### 3.1 创建新类别

接口说明：

| 功能描述    | 获取餐厅基本信息      |
| ----------- | --------------------- |
| URL正式描述 | /api/v1/menu/category |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 201    | JSON: <br />{<br />  code: 201,<br />  msg: 'Category created',<br />  data: {<br />    category_id: xxx,<br />    restaurant_id: xxx, <br />    name: xxx,<br />  }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

### 3.2 创建新菜品

接口说明：

| 功能描述    | 获取餐厅基本信息  |
| ----------- | ----------------- |
| URL正式描述 | /api/v1/menu/dish |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 201    | JSON: <br />{<br />  code: 201,<br />  msg: 'Dish created',<br />  data: {<br />    dish_id: xxx,<br />    restaurant_id: xxx,<br />    creation_date: xxx,<br />    dish_name: xxx,<br />    price: xxx, <br />    image_id: xxx,<br />    flavor: xxx, <br />    category_id: xxx, <br />    favorate_rate: xxx, <br />    comment_number: xxx,<br />    description: xxx<br />   }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

### 3.3 获取菜单信息

接口说明：

| 功能描述    | 获取餐厅基本信息 |
| ----------- | ---------------- |
| URL正式描述 | /api/v1/menu     |

表单参数：

返回示例：

| status | 返回体                                                       |
| ------ | ------------------------------------------------------------ |
| 200    | JSON: <br />{<br />  code: 200,<br />  msg: 'Get successfully',<br />  data: {<br />    menu: [<br />      {<br />        category_id: xxx, <br />        name: xxx, <br />        dishes: [<br />          {<br />            dish_id: xxx,<br />            restaurant_id: xxx,<br />            creation_date: xxx,<br />            dish_name: xxx,<br />            price: xxx, <br />            image_id: xxx,<br />            flavor: xxx, <br />            category_id: xxx, <br />            favorate_rate: xxx, <br />            comment_number: xxx,<br />            description: xxx<br />          },<br />          {<br />            dish_id: xxx,<br />            restaurant_id: xxx,<br />            creation_date: xxx,<br />            dish_name: xxx,<br />            price: xxx, <br />            image_id: xxx,<br />            flavor: xxx, <br />            category_id: xxx, <br />            favorate_rate: xxx, <br />            comment_number: xxx,<br />            description: xxx<br />          }<br />        ]<br />      }, <br />      {<br />        category_id: xxx,<br />        name: xxx, <br />        dishes: {}<br />      }<br />    ]<br />  }<br />} |
| 401    | {<br />  errcode: 401,<br />  errmsg: 'Wrong format',<br />} |
| 500    | {<br />  errcode: 500,<br />  errmsg: 'Internal error',<br />} |

## 4. 订单相关

### 4.1 创建订单



### 4.2 获取订单列表





## 5. 评论相关



