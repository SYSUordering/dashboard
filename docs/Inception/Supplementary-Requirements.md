# 补充性规格说明

## 修订历史
| 版本 | 日期 | 描述 | 作者 |
| :---- |:----- | :------ | :----- |
| 初始草案 | 2018年6月22日 | 第一个草案。主要在细化阶段中进行精化 | zhangchen |

## 简介
本文档记录了知单的所有未在用例中描述的需求

## 功能性
1. 日志和错误处理：
- 在持久性存储中记录所有错误
2. 可插拔规则：
- 在几个用例的不同场景点执行一组规划，以支持对系统功能的定制
3. 安全性：
- 任何使用都需要经过用户认证

## 可用性
- 人性因素
    1. 顾客能在保持正常坐姿的姿势，轻松扫描到二维码
    2. 避免使用一般色盲人群难以辨认的颜色
    3. 避免使用过小的字体，商家应能轻松识别屏幕上的，并增加一些语音提示
- 快捷，无错的点餐处理极为重要，客户希望能够快速准确的点完参，否则回哦给他们带来不好的点餐体验。
- 提示性：应该用一些提示的因素，比如语音提示和弹框提示。


## 可靠性
1. 可适应性：
- 不同用户在处理点餐业务时都能够适应其不同的需求并完成业务。
2. 可配置性：
- 对于商家端，当拥有电脑的时候即可开始配置业务
- 对于客户，只要有一台智能手机即可参与扫码点餐。


## 实现约束
知单系统采用各种语言共同开发，前端采用vue，后端则采用node.js和基于其的express框架，每部分完成其固有的逻辑功能，实现逻辑分离，且易于拥有不同技能的成员开发。

## 免费开源构建
1. vue.js渐进式js框架
2. elementUI
3. node.js
4. node.js下的express框架


## 法律问题
本系统使用了所有开源框架，但是因为是课程学习，不涉及商业用途，因此不用担心法律问题。
