if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Embedding" ]; then
    mkdir ./logs/Embedding
fi

for embed_type in 1 2 3 4
do
for model_name in Autoformer Informer Transformer
do 
for pred_len in 18
do
  python -u run_longExp.py \
    --is_training 1 \
    --root_path ./dataset/Ship/ \
    --data_path .csv \
    --model_id ship_18_$pred_len \
    --model $model_name \
    --data Ship \
    --features M \
    --seq_len 18 \
    --label_len 18 \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 4 \
    --dec_in 4 \
    --c_out 4 \
    --des 'Exp' \
    --itr 1 \
    --train_epochs 1 --embed_type $embed_type >logs/Embedding/$embed_type'_'$model_name'_exchange_rate_'$pred_len.log
done
done
done