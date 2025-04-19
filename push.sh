# 执行 git push
function do_push() {
    git add .
    git commit -m "update"
    export http_proxy=http://192.168.48.17:18000; export https_proxy=http://192.168.48.17:18000
    while true; do
        git push -f origin main
        if [ $? -eq 0 ]; then
            echo "Push successful!"
            break
        else
            echo "Push failed. Retrying..."
            sleep 1
        fi
    done
}


# 根据命令行参数执行相应操作
case "$1" in
    "push")
        do_push
        ;;
    *)
        echo "Usage: $0 {clone|pull|push}"
        exit 1
        ;;
esac