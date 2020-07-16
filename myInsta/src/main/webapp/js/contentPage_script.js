$(() => {
    const contentidx = $("#content_bidx").val();
    const followingid = $("#content_mcuseridx").val();
    $(".btn_heart").on("click", function () {
        const btnheart = $(this);
        axios
            .post("./LikeServlet", "contentidx=" + contentidx)
            .then(function (response) {
                if (btnheart.hasClass("on")) {
                    btnheart.removeClass("on").addClass("off");
                    cntlikes.text(numcnt - 1);
                } else {
                    btnheart.removeClass("off").addClass("on");
                    cntlikes.text(numcnt + 1);
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        const cntlikes = $(".cntlikes");
        let numcnt = Number(cntlikes.text());
    });
    $(".btn_keep").on("click", function () {
        const btnkeep = $(this);
        axios
            .post("./SaveServlet", "contentidx=" + contentidx)
            .then(function (response) {
                if (btnkeep.hasClass("on")) {
                    btnkeep.removeClass("on").addClass("off");
                } else {
                    btnkeep.removeClass("off").addClass("on");
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    });
    $(".mybtn7").on("click", function () {
        const btnFollow = $(this);
        console.log("팔로우아이디" + followingid);
        console.log(btnFollow.text());
        axios
            .post("./FollowServlet", "followingid=" + followingid)
            .then(function (response) {
                setTimeout(function () {
                    if (btnFollow.text() == "팔로우 취소") {
                        $("#mybtn5_2").text("팔로우").css("color", "#0095f6");
                        btnFollow.text("팔로우").css("color", "#0095f6");
                    } else {
                        $("#mybtn5_2").text("팔로우 취소").css("color", "#f00");
                        btnFollow.text("팔로우 취소").css("color", "#f00");
                    }
                },300);
            })
            .catch(function (error) {
                console.log(error);
            });
    });
});
