# shellcheck shell=sh
# shellcheck disable=SC2039

xrc http/v0 param/v0 json/v0 str/v0 gitee/v0 assert/v0

test_gitee() {
    echo "gitee开始测试"
    test_get_token() {
        gt_token c32352471710e3306fd215919d15e034
        assert "$(gt_token)" = c32352471710e3306fd215919d15e034
    }
    test_gt_current() {
        assert "$(gt_current owner)" = "mycw-tzw"
        assert "$(gt_current owner type)" = "user"
    }
    test_get_token
    test_gt_current
    echo "gitee测试结束"
}