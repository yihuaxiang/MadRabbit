# MadRabbit



### 👇更新日志👇

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

##### 目前已知问题：
* 身份验证未写，出现身份验证的，私聊我，我去测试适配

### 1.3.0(amd)版本更新 
* 增加授权文件，无授权文件启动容器的后果自负，授权文件在内部群获取

> 获取授权文件后，改名为Rabbit.lic，放在Config目录下，容器启动命令已更新，需用新的启动命令

#### 目前功能：自动过魔方和拼图验证获取ck，wsck提交，比价领取优惠券，未对接芝士，xdd等，不要来问我

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
3、下载config.json 配置文件 不要修改配置，先确保能访问gitee，能正常打开网页，否则会跑enen
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
```
docker pull ht944/rabbit:latest
```
启动
```
cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  "$(pwd)"/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:latest
```

### 启动完之后，检查能否正常访问，可以就可以配置配置文件了，然后重启容器

### 阿里和腾讯服务器可以忽略这一步：
> 使用稳定的http或socks代理(无账号密码认证的代理)
> 格式为：http://xxx.xxx.xxx.xxx:xxxx或socks://xxx.xxx.xxx.xxx:xxxx
> 设置配置文件中的proxy即可

### 对接WXPUSHER
* 正常填写其他信息，回调接口填写：http://ip:port/api/bind

### 授权用户免费10次log实时计算服务
* 接口为：http://ip:port/api/log
* 关闭计算服务：http://ip:port/api/log1
* 启动需要重启

# 浏览器无法下载的解决方案
1.下载并解压浏览器
```
cd /root/Rabbit && wget https://mirrors.huaweicloud.com/chromium-browser-snapshots/Linux_x64/884014/chrome-linux.zip && unzip chrome-linux.zip && rm  -f chrome-linux.zip
```
2.手动删除原有容器
3.重启启动容器
```
cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  "$(pwd)"/Config:/usr/src/Project/Config -v "$(pwd)"/chrome-linux:/usr/src/Project/ChromeBrowser -it --privileged=true  ht944/rabbit:latest
```

### 强调一遍
### 配置文件修改后，重新启动容器


## 一键升级
```
docker stop rabbit && docker rm rabbit && docker pull ht944/rabbit:latest && cd /root/Rabbit && docker run --name rabbit -p 5701:1234  -d  -v  "$(pwd)"/Config:/usr/src/Project/Config -it --privileged=true  ht944/rabbit:latest
```


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
