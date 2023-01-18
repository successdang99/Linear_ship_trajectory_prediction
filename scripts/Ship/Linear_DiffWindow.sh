if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LookBackWindow" ]; then
    mkdir ./logs/LookBackWindow
fi

model_name=DLinear

for pred_len in 18
do
for seq_len in 18
do
  python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/Ship/ \
  --data_path .csv \
  --model_id ship_$seq_len'_'$pred_len \
  --model $model_name \
  --data Ship \
  --features M \
  --seq_len $seq_len \
  --label_len 18 \
  --pred_len $pred_len  \
  --enc_in 4 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.05 >logs/LookBackWindow/$model_name'_'ship_$seq_len'_'$pred_len.log
done
done