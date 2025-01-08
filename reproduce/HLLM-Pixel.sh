#!/bin/bash
# Copyright (c) 2024 Bytedance Ltd. and/or its affiliate

# 1B: 32 A100s for ≈ 4.1days
cd code && python3 main.py \
--config_file overall/LLM_deepspeed.yaml HLLM/HLLM.yaml \
--MAX_ITEM_LIST_LENGTH 10 --epochs 5 --optim_args.learning_rate 1e-4 \
--checkpoint_dir /root/autodl-fs/out/20250107/hllm/01 \
--loss nce --MAX_TEXT_LENGTH 256 --dataset Pixel200K \
--text_path /root/autodl-fs/projects/HLLM/information \
--item_pretrain_dir /root/autodl-fs/models/TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T \
--user_pretrain_dir /root/autodl-fs/models/TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T \
--train_batch_size 2 \
--gradient_checkpointing True \
--stage 3