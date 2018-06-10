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
```json
// success
Header: Set-Cookie: 'sid=xxxxx'
JSON: 
{
	code: 201,
	msg: 'Session created'
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



### 1.2 更新&检查餐厅登录状态

接口说明：

| 功能描述 | 检查当前session的有效性，同时更新session的TTL |
| -------- | --------------------------------------------- |
| 正式URL  | /api/v1/session                               |
| method   | GET                                           |
| 请求体   | 无                                            |
| 返回值   | JSON格式，见返回示例                          |

返回示例：
```json
// success
Header: {Set-Cookie: 'sid=xxxxx'}
JSON: 
{
    code: 200,
    msg: 'Session updated'
}

// error
{
    errcode: 401,
    errmsg: 'Not login'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



### 1.3 登出餐厅账号

接口说明：

| 功能描述 | 删除登录会话状态     |
| -------- | -------------------- |
| 正式URL  | /api/v1/session      |
| method   | DELETE               |
| 请求体   | 表单形式，见下表     |
| 返回值   | JSON格式，见返回示例 |

返回示例：

```json
// success
{
    code: 200,
    msg: 'Session deleted'
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}

```



## 2. 餐厅相关

### 2.1 注册餐厅

接口说明：

| 功能描述    | 注册餐厅账户       |
| ----------- | ------------------ |
| URL正式描述 | /api/v1/restaurant |

表单参数：

返回示例：

```json
// success
{
    code: 201,
    msg: 'Restaurant created',
    data: {
        restaurant_id: xxx,
        manager_number: xxx,
        restaurant_name: xxx,
        restuarant_number: xxx,
        image_id: xxx,
        description: xxx,
        categories: [
            {category_id: xxx1,  name: xxx1},
            {category_id: xxx2,  name: xxx2}
        ],
        desks: [
            {desk_id: xxx1, desk_link: xxx1, desk_number: xxx1},
            {desk_id: xxx2, desk_link: xxx2, desk_number: xxx2},
        ]
    }
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}


```



### 2.2 获取餐厅信息


接口说明：

| 功能描述    | 获取餐厅基本信息   |
| ----------- | ------------------ |
| URL正式描述 | /api/v1/restaurant |

表单参数：

返回示例：
```json

// success
{
    code: 200,
    msg: 'Get successfully',
    data: {
        restaurant_id: xxx,
        manager_number: xxx,
        restaurant_name: xxx,
        restuarant_number: xxx,
        image_id: xxx,
        description: xxx,
        categories: [
            {category_id: xxx1,  name: xxx1},
            {category_id: xxx2,  name: xxx2}
        ],
        desks: [
            {desk_id: xxx1, desk_link: xxx1, desk_number: xxx1},
            {desk_id: xxx2, desk_link: xxx2, desk_number: xxx2},
        ]
    }
}


// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



### 2.3 创建餐桌

接口说明：

| 功能描述    | 注册餐厅账户            |
| ----------- | ----------------------- |
| URL正式描述 | /api/v1/restaurant/desk |

表单参数：

返回示例：

```json
// success
{
    code: 201,
    msg: 'Desk created',
    data: {
        desk_id: xxx,
        desk_link: xxx,
        restaurant_id: xxx,
        desk_number: xxx,
    }
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



## 3. 菜单相关

### 3.1 创建新类别

接口说明：

| 功能描述    | 获取餐厅基本信息      |
| ----------- | --------------------- |
| URL正式描述 | /api/v1/menu/category |

表单参数：

返回示例：


```json
// success
{
    code: 201,
    msg: 'Category created',
    data: {
        category_id: xxx,
        restaurant_id: xxx, 
        name: xxx
    }
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



### 3.2 创建新菜品

接口说明：

| 功能描述    | 获取餐厅基本信息  |
| ----------- | ----------------- |
| URL正式描述 | /api/v1/menu/dish |

表单参数：

返回示例：

```json
// success
{
    code: 201,
    msg: 'Dish created',
    data: {
        dish_id: xxx,
        restaurant_id: xxx,
        creation_date: xxx,
        dish_name: xxx,
        price: xxx, 
        image_id: xxx,
        flavor: xxx, 
        category_id: xxx,
        favorate_rate: xxx,
        comment_number: xxx,
        description: xxx
    }
}


// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



### 3.3 获取菜单信息

接口说明：

| 功能描述    | 获取餐厅基本信息 |
| ----------- | ---------------- |
| URL正式描述 | /api/v1/menu     |

表单参数：

返回示例：


```json
// success
{
    code: 200,
    msg: 'Get successfully',
    data: {
        menu: [
            {
                category_id: xxx, 
                name: xxx, 
                dishes: [
                    {
                        dish_id: xxx,
                        restaurant_id: xxx,
                        creation_date: xxx,
                        dish_name: xxx,
                        price: xxx,
                        image_id: xxx,
                        flavor: xxx, 
                        category_id: xxx, 
                        favorate_rate: xxx, 
                        comment_number: xxx,
                        description: xxx
                    },
                    {
                        dish_id: xxx,
                        restaurant_id: xxx,
                        creation_date: xxx,
                        dish_name: xxx,
                        price: xxx,
                        image_id: xxx,
                        flavor: xxx,
                        category_id: xxx, 
                        favorate_rate: xxx,
                        comment_number: xxx,
                        description: xxx
                    }
                ]
            },
            {
                category_id: xxx,
                name: xxx,
                dishes: {}
            }
        ]
    }
}

// error
{
    errcode: 401,
    errmsg: 'Wrong format'
}

{
    errcode: 500,
    errmsg: 'Internal error'
}
```



## 4. 订单相关

### 4.1 创建订单



### 4.2 获取订单列表





## 5. 评论相关



