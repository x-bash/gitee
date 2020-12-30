. gitee

shopt -s expand_aliases

# http.debug.enable

echo "set current owner"
gt.current_owner x-bash

echo "create repo"
gt.org.repo.create x-bash/test123

echo "list repo"
gt.org.repo.list x-bash

echo "destroy repo"
gt.repo.destroy x-bash/test123

# gt.current_owner edwinjhlee
# gt.repo.create x-bash

