$(function () {
    $(".p_lText").click(function () {
        $(".fp").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp").fadeOut();
    });
});

$(function () {
    $(".p_lText2").click(function () {
        $(".fp2").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp2").fadeOut();
    });
});

// 팔로우 버튼
$(function () {
    $(".fw_btn").on("click", function () {
        const btnFollow = $(this);
        let followingid = $(this).next().val();
        console.log("팔로우아이디" + followingid);
        console.log(btnFollow.text());
        axios
            .post("./FollowServlet", "followingid=" + followingid)
            .then(function (response) {})
            .catch(function (error) {
                console.log(error);
            });
    });
});

$(function () {
    $(".fw_btn").on("click", function () {
        let cntfollow = Number($(".cntfollow").text());
        let fiuserid=$(this).parent().prev().find("p").text();
        console.log(fiuserid);
        if ($(this).val() == "팔로우") {
            $(this).css("background-color", "#fff");
            $(this).val("팔로잉").css("color", "#000").css("border", "1px solid #ccc");
            $(".cntfollow").text(cntfollow + 1);
            //let input = $("input[value="++");
        } else {
            $(this).css("background-color", "#0095f6");
            $(this).val("팔로우").css("color", "#fff");
            $(".cntfollow").text(cntfollow - 1);
        }
    });
});
