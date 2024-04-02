#!/bin/zsh  
  
# 设置基础路径  
BASE_PATH="./patents"  
  
# 创建一个函数，根据文件编号将其放入适当的目录结构并创建文件  
create_file() {  
    local file_number=$1  
    local level1_dir=""  
    local level2_dir=""  
    local sub_dir=""  
    local dir_path=""  
  
    # 根据文件编号计算目录层级  
    level1_dir=$(printf "%02d" $((file_number / 10000 % 100)))  
    level2_dir=$(printf "%02d" $((file_number / 100 % 100)))  
    sub_dir="${level1_dir}/${level2_dir}"  
    dir_path="${BASE_PATH}/${sub_dir}"  
  
    # 创建目录结构  
    mkdir -p "$dir_path"  
  
    # 在目录中创建文件  
    touch "$dir_path/patent_${file_number}.txt"  
    echo "Patent text for file number $file_number" > "$dir_path/patent_${file_number}.txt"  
    echo "Created file: $dir_path/patent_${file_number}.txt"  
}  
  
# 主程序开始  
# 你可以根据需要修改起始和结束文件编号  
start_number=1  
end_number=1000000  
  
# 创建基础路径（如果不存在）  
mkdir -p "$BASE_PATH"  
  
# 为每个文件编号创建文件  
for ((i=$start_number; i<=$end_number; i++)); do  
    create_file $i  
done  
  
echo "All files have been created."
