% 人文1901  107242019000922 段辰昕

% 名字信息以及文件保存信息
% （避免系统错误，文件名不包含空格）
% 初始化存储以下信息为 auth 和 auth0 的字符串，可重复使用

auth = "班级：人文1901, 学号：107242019000922， 姓名：段辰昕";
auth0 = "人文1901_107242019000922_段辰昕";
% 第一题：

% 用append连接文件夹路径、字符串和后缀，形成完整文件路径
outname = append("c:\\1\\",auth0,".xlsx");

% 如果同名文件存在，删除同名文件
if exist(outname, 'file')==2
  delete(outname)
end

% 头部组成部分为"1.xlsx"
headerCell = readcell("1.xlsx");

% 头部第一部分（"海拔"）
h1 = string(headerCell{1});

% 头部第二部分（"sos"）
h2 = string(headerCell{2});

% 将头部写入新文件第一行
writecell({h1,h2}, outname);

% 初始化“海拔数据”列 和 “sos数据”列，均为全部是0的两列数据
altiVec=zeros(30,1); sosVec=zeros(30,1);

% 循环 i 从 2 到 31 （之后写入区域在2行至31行）
for i = 2:31

    % 用 i+后缀 形成读取的文件名（2.xlsx - 31.xlsx）
    name = append(string(i),".xlsx");
    % row 为文件内容（一行）
    row = readtable(name);

    % row 的（1, 1）位置为当前文件的 “海拔” 数据
    alti = row{1,1};

    % row 的（1, 2）位置为当前文件的 “SOS” 数据
    sos = row{1,2};

    % 讲读取的内容海拔和SOS分别写入 “海拔数据” 列 和 “SOS数据” 列
    altiVec(i-1) = alti;
    sosVec(i-1) = sos;

    % 讲读取的内容海拔和SOS分别写入 新文件 的行中
    writecell({alti, sos}, outname, 'WriteMode','Append');
end


% 第二题：
% 包含31（31 = “海拔数据” 的数量）个渐变色的数据值（摘抄自matlab官网的scatter教程）
colors = linspace(1,10,length(altiVec));

% 新建散点图，x、y值，大小=20，颜色为渐变色
scatter(altiVec,sosVec,20,colors);
% 不关闭图，继续编辑
hold on

% 连接散点
line(altiVec, sosVec)

% 用polyfit得到海拔和sos的线性关系(拟合曲线)数据（斜率和交点）
coefs = polyfit(altiVec, sosVec, 1);

% 用取得的画出拟合曲线
h = refline(coefs(1), coefs(2));

% 图片编辑完毕
hold off


% 将 R 和 P 值通过corrcoef计算
[R,P] = corrcoef(altiVec, sosVec);
% 注意，corrcoef输出两个对角矩阵
% R =
%   1.0000    0.9180
%   0.9180    1.0000
% 以及
%
% P = 
%   1.0000    0.0000
%   0.0000    1.0000
%
% 其中，实际我们用的数值为第二个数字


% 提取至 R 和 P 变量中
R = R(2); P = P(2);

% 取小数点后两位
R = round(R,2); P = round(P,2);


% 拟合曲线的描述字符串，%f 为小数占位符，（相对于逗号后面的每个数据）
refInfo = sprintf("y = %f x + %f\nr = %f, P = %f", coefs(1), coefs(2), R, P);
% 生成文字，放在坐标 (200, 140)
text(200,140,refInfo);

% 得到最大、最小、平均、方差的整数值
maxSos = round(max(sosVec)); minSos = round(min(sosVec));
avg = round(mean(sosVec)); sd = round(std(sosVec));

% 描述字符串， %d 为整数占位符，\n 为换行
sosStats = sprintf("最小值 = %d day\n最大值 = %d day\n平均值 = %d day\n标准差 = %d day", maxSos, minSos, avg, sd);
% 生成文字，放在坐标 (2000, 100)
text(2000,100,sosStats);

% 标题、xy轴标签
title(auth);
xlabel("海拔(m)");
ylabel("SOS(day)");
