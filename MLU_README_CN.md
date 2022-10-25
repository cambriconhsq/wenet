# WeNet on Cambricon
本项目展示了 WeNet 在寒武纪加速卡 MLU 设备上, 使用推理引擎 MagicMind 进行推理的案例。


## 环境搭建

推荐使用寒武纪发布的镜像。

## 如何运行

### 模型获取
- 首先参照官网指引完成 wenet 安装
https://github.com/wenet-e2e/wenet 
其中 torch 使用版本 1.9

```
pip install torch==1.9.1+cpu
```

实验测试使用版本

tag v2.0.0 (d2c41cb34258b4e696bc3e87f88b20ee76e4bae8)

本分支在此版本上进行适配测试。

- 下载预训练模型
```
 wget http://mobvoi-speech-public.ufile.ucloud.cn/public/wenet/wenetspeech/20211025_conformer_exp.tar.gz
```

- 导出 onnx

```
cd /path/to/wenet/examples/aishell/s0
python3 wenet/bin/export_onnx_gpu.py --config 20211025_conformer_exp/train.yaml --checkpoint 20211025_conformer_exp/final.pt --beam 4
```

可以看到当前目录下生成 onnx_model

```
onnx_model/
|-- config.yaml
|-- decoder.onnx
`-- encoder.onnx
```

### ctc decoder
沿用官方仓库，实验推理代码用到了一个 ctc decoder 包，可以按下述方式安装
```
git clone https://github.com/Slyne/ctc_decoder.git
apt-get update
apt-get install swig
apt-get install python3-dev
cd ctc_decoder/swig && bash setup.sh
```

### 模型编译工具安装

安装 mm_build 模型编译工具
```bash
cd /usr/local/neuware/samples/magicmind/mm_build
mkdir build
cd build
cmake .. & make
```

### 模型编译&推理

相关数据集配置和官方仓库保持一致，项目文件位置路径等参数设置可能需要在下列脚本中调整。

1. 模型编译

```bash 
bash build_magicmind.sh
```
2. 执行测试集推理
```bash 
bash recognize_magicmind.sh
```

### 使用预训练模型在 AISHELL 上的 WER
|model|dataset|test set|decoding method|MLU|
|---|---|---|---|---|
|conformer|aishell|test|attention rescoring|4.68|


## 相关链接
WeNet：https://wenet.org.cn/wenet/

寒武纪开发者社区文档中心：https://developer.cambricon.com/index/document/index/classid/3.html

