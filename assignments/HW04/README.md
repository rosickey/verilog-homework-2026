## 第四次作业（HW04）：频率、占空比可调的信号发生器

### 1. 修改课堂订正的clk_gen.v文件，使其能够根据参数输出不同频率和占空比的方波


### 2. 设计要求

- 必须使用课堂已经订正的 clk_gen_o.v 文件进行测试。
- 可选择提交top_tb.v文件，实例化clk_gen_o.v，并测试至少两种频率和占空比。
- 注意大小写和缩进。
- 占空比和频率范围，自行指定。

### 3. 提交文件和 PR

| 路径 | 说明 |
| --- | --- |
| `students/240201101/HW04/clk_gen_o.v` | 激励信号模块 |
| `students/240201101/HW04/top_tb.v` | 测试文件，选择提交 |
| `students/240201101/HW04/report.png` | 波形图文件，选择提交 |


在自己的学号分支上，通过 Pull Request 提交至教师仓库 `rosickey/verilog-homework-2026` 的 `main`。标题格式为：

```text
[240201101] HW04 - 王小明
```

请替换为自己的学号和姓名。Git 具体操作[四、正常提交课程作业](https://github.com/rosickey/verilog-homework-2026#%E5%9B%9B%E6%AD%A3%E5%B8%B8%E6%8F%90%E4%BA%A4%E8%AF%BE%E7%A8%8B%E4%BD%9C%E4%B8%9A)