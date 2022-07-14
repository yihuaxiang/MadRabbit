# MadRabbit

> 获取授权文件后，改名为Rabbit.lic，放在Config目录下，容器启动命令已更新，需用新的启动命令

#### 目前功能：自动过魔方和拼图验证获取ck，wsck提交，比价领取优惠券，仅支持对接青龙、xdd、傻妞，不支持其他工具对接
#### 傻妞和青龙可共存，青龙配置为空时，无法使用网页端登录

# [👉科学上网的频道](https://t.me/Rabbit_one)

## 使用方法:
1、新建一个项目
```
cd /root && mkdir -p  Rabbit && cd Rabbit
```
2、创建一个目录放配置
```
cd /root/Rabbit && mkdir -p  Config
```
3、下载config.json 配置文件
```
cd /root/Rabbit/Config && wget -O Config.json  https://raw.githubusercontent.com/ht944/MadRabbit/main/Config.json
```
国内用
```
cd /root/Rabbit/Config && wget -O Config.json  https://ghproxy.com/https://raw.githubusercontent.com/ht944/MadRabbit/main/Config.json
```
4、配置完后
```
cd /root/Rabbit
```

### 安装：(ARM架构的机器自己将latest改成arm)
#### 方案一：自行构建镜像(由于有人魔改Rabbit，不再开源)
先下载源码，上传到此文件夹，再运行接下来的命令
```

```
启动
```

```
#### 方案二：使用我的镜像
3.1.0版本
```
docker pull ht944/rabbit:latest
```
启动
```
cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:latest
```
3.2.0的amd版本
```
docker pull ht944/rabbit:3.2.0
```
启动
```
cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:3.2.0
```
3.2.0的arm版本
```
docker pull ht944/rabbit:arm-3.2.0
```
启动
```
cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:arm-3.2.0
```

### 对接WXPUSHER
* 正常填写其他信息，回调接口填写：http://ip:port/api/bind


### 家宽ip变化的，搭配ip.sh文件使用，ip变化时，自动重启rabbit
使用方法：
1.新建日志文件
```
cd /root/Rabbit && wget https://raw.githubusercontent.com/HT944/MadRabbit/main/ip.sh && touch tool.log && bash ip.sh
```
2.运行上面命令后自己定时
```
crontab -e
```
3.里面写入，可自行百度一下cron定时表达式(这里默认每分钟检测一次)：
```
*/1 * * * * bash /root/Rabbit/ip.sh
```

### 强调一遍
### 配置文件修改后，重新启动容器


## 一键升级
```
docker stop rabbit && docker rm rabbit && docker pull ht944/rabbit:latest && cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:latest
```

## 3.2.0的amd版本升级
```
docker stop rabbit && docker rm rabbit && docker pull ht944/rabbit:latest && cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:3.2.0
```

## 3.2.0的arm版本升级
```
docker stop rabbit && docker rm rabbit && docker pull ht944/rabbit:latest && cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  /root/Rabbit/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:arm-3.2.0

### 👇更新日志👇

#### 3.2.0(amd/arm)版本更新
* 解决验证码识别问题，不依赖打码平台


#### 2.2.0(amd/arm)版本更新
* 为保障不被他人白嫖，强制更新最新版，老板本将无法使用
* 优化log计算方法，不再占用大内存，开启仅多占用10m内存
* 为防止log被他人爆破获取，5次失败会锁定，需重启
* 增加傻妞的token认证，对接傻妞需最新版rabbit，最新版傻妞，且傻妞配置 `set jd_cookie ark2.0_token xxxx`，rabbit须在最新配置文件中配置SILLY_TOKEN，二者需要保持一致

#### 2.1.6(amd/arm)版本更新
* 修复授权问题
* log请求需携带token，token需在配置文件中设置(请求示例：http://ip:port/api/log?token=123546)

#### 2.1.5(amd/arm)版本更新
* 修改授权，所有人必须更新最新版，无需重新获取授权
* 傻妞对接时，可以配置青龙，否则网页端无法使用
* 仅可对接青龙，xdd，芝士，不支持其他平台对接（芝士需更新最新版）
* 修复过期预警的时间戳判断问题
* 尝试修复网络问题

#### 2.1.4(amd/arm)版本更新
* 修复前端无法二验的问题
* 无授权机器可以启动rabbit，但是无法登陆
* 修复部分bug，主要为错误无提示，不回收问题
* 增加登陆时间，尝试解决网络差的机器无法获取验证码问题

#### 2.1.0(amd/arm)版本更新
* 不再需要腾讯阿里的ip，任何机器均可登陆
* 可以留空青龙配置，傻妞可对接rabbit
* 优化前端加载速度（感谢 @svips188 的优化）
* 更换授权域名
* 修复xdd不显示登陆成功的bug
* 修复log计算的bug
* 修复青龙配置有误无法进入主页的bug
* 修复一些影响正常使用的bug

#### 2.0.7(amd/arm)版本更新
* 适配青龙2.11及以上(需要青龙应用的系统权限)
* 修复大量bug，解决一些常见问题，如收不到验证码之类的

#### 2.0.6(amd/arm)版本更新
* 采取内置浏览器方式，无需下载浏览器
* 适配群辉机器
* 适配arm机器，arm机器拉取时更换后缀为arm

#### 2.0.5(amd)版本更新
* 修复xdd接口错误问题
* 浏览器无法下载的，可手动下载
* 修复部分小bug
* log计算服务的开启采用变量控制，配置文件已更新(默认关闭)

#### 2.0.4(amd)版本更新
* 修复xdd对接，登陆成功后一直转圈问题
* 去除假授权enen机制，保留假授权炸鸡机制

#### 2.0.3(amd)版本更新
* 对接xdd(配置文件已更新，配置好)
* 更换个人中心用户昵称接口
* 修复部分bug
* 身份认证出错的，带上日志和Config目录下的截图反馈

#### 2.0.2(amd)版本更新
* 修复重大bug

#### 2.0.1(amd)版本更新

* 更新二验，解决部分需要二验的账号（需要输入身份证前两位和后四位，无需分割，最后一位为X的直接写X，例如：12345X）

#### 2.0.0(amd)版本更新
* 更换登陆地址（健康社区）
* 优化授权机制
* 优化授权服务器网络
* 提高识别准确率
* 移除失效的快捷登陆接口
* 修复部分bug


## 特别声明:

* 本仓库涉仅用于测试和学习研究，禁止用于商业用途，不能保证其合法性，准确性，完整性和有效性，请根据情况自行判断.

* 本项目内所有资源文件，禁止任何公众号、自媒体进行任何形式的转载、发布。

* ht944对任何代码问题概不负责，包括但不限于由任何脚本错误导致的任何损失或损害.

* 间接使用本仓库搭建的任何用户，包括但不限于建立VPS或在某些行为违反国家/地区法律或相关法规的情况下进行传播, ht944对于由此引起的任何隐私泄漏或其他后果概不负责.

* 请勿将本项目的任何内容用于商业或非法目的，否则后果自负.

* 如果任何单位或个人认为该项目的脚本可能涉嫌侵犯其权利，则应及时通知并提供身份证明，所有权证明，我们将在收到认证文件后删除相关代码.

* 任何以任何方式查看此项目的人或直接或间接使用本仓库项目的任何脚本的使用者都应仔细阅读此声明。ht944 保留随时更改或补充此免责声明的权利。一旦使用并复制了任何本仓库项目的规则，则视为您已接受此免责声明.

**您必须在下载后的24小时内从计算机或手机中完全删除以上内容.**  </br>
> ***您使用或者复制了本仓库且本人制作的任何脚本，则视为`已接受`此声明，请仔细阅读***

## 多谢
