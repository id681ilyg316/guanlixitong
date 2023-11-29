## 本项目实现的最终作用是基于JSP员工出差请假考勤管理系统
## 分为1个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 假期申请记录增删改查
 - 出差申请记录增删改查
 - 加班申请记录增删改查
 - 员工管理增删改查
 - 查看考勤详情
 - 登录
 - 考勤查询
 - 考勤记录增删改查
 - 调休申请
 - 首页
## 数据库设计如下：
# 数据库设计文档

**数据库名：** kaoqin

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [basic](#basic) |  |
| [chuchaishenqing](#chuchaishenqing) |  |
| [jiabanshenqing](#jiabanshenqing) |  |
| [jiaqishenqing](#jiaqishenqing) |  |
| [kaoqinjilu](#kaoqinjilu) |  |
| [staff](#staff) |  |
| [tiaoxiushenqing](#tiaoxiushenqing) |  |
| [user](#user) | 用户表 |

**表名：** <a id="basic">basic</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  2   | value |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 值  |

**表名：** <a id="chuchaishenqing">chuchaishenqing</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | chuchaishijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | chuchaitianshu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | tongxingrenyuan |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | mudidi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | chuxingfangshi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | shiyou |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="jiabanshenqing">jiabanshenqing</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | staff_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | shenqingshijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | jiabanshijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | jiabanshichang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | yuanyin |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="jiaqishenqing">jiaqishenqing</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | staff_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | kaishishijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | jieshushijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | shichang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | jiaqileixing |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | yuanyin |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="kaoqinjilu">kaoqinjilu</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | kaoqinshijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | leibie |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 类别  |
|  4   | staff_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | kaoqinshiduan |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | shuoming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 说明  |
|  7   | jiluren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="staff">staff</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |

**表名：** <a id="tiaoxiushenqing">tiaoxiushenqing</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | staff_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | shenqingshijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | begin |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | end |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | tiaoxiushichang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | tiaoxiuyuanyin |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="user">user</a>

**说明：** 用户表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  3   | password |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |

**运行不出来可以微信 javape 我的公众号：源码码头**
