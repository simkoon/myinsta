$(() => {
    let start = 0;
    let pending = false;

    const setbtnActions = function (newArticle, contentidx, islikeon, issaveon) {
        $(newArticle)
            .find(".con_btnLike")
            .on("click", function () {
                axios
                    .post("./LikeServlet", "contentidx=" + contentidx)
                    .then(function (response) {})
                    .catch(function (error) {
                        console.log(error);
                    });
                const cntlikes = $(newArticle).find(".con_cntlikes");
                let numcnt = Number(cntlikes.text());

                if ($(this).attr("src") == "./images/heart.png") {
                    $(this).attr("src", "./images/emptyheart.png");
                    cntlikes.text(numcnt - 1);
                } else {
                    $(this).attr("src", "./images/heart.png");
                    cntlikes.text(numcnt + 1);
                }
            });

        if (islikeon) {
            $(newArticle).find(".con_btnLike").attr("src", "./images/heart.png");
        }

        $(newArticle)
            .find(".con_btnSave")
            .on("click", function () {
                axios
                    .post("./SaveServlet", "contentidx=" + contentidx)
                    .then(function (response) {})
                    .catch(function (error) {
                        console.log(error);
                    });

                if ($(this).attr("src") == "./images/save.png") {
                    $(this).attr("src", "./images/emptysave.png");
                } else {
                    $(this).attr("src", "./images/save.png");
                }
            });

        if (issaveon) {
            $(newArticle).find(".con_btnSave").attr("src", "./images/save.png");
        }
    };
    // 태그에 링크걸기
    const getTaglink = (str) => {
        const setlink = (tag) => {
            let link =
                /*html*/
                `<a style="color: skyblue" href="./${tag.substr(1)}">${tag}</a>`;
            return link;
        };
        const emptyFilter = (arrs) => {
            return arrs.filter(function (item) {
                return item !== null && item !== undefined && item !== "";
            });
        };

        str = str.split(" ");
        let strmap = /*html*/ ``;
        str.map((x) => {
            if (x.includes("#")) {
                if (x.match(/#/g).length > 1) {
                    let sphash = x.trim().split("#");

                    sphash = emptyFilter(sphash);

                    for (strel of sphash) {
                        strmap += setlink("#" + strel);
                    }
                    strmap += " ";
                    return;
                }
                strmap += setlink(x) + " ";
                return;
            }
            strmap += x + " ";
            return;
        });
        return strmap;
    };

    // 코멘트 2개만 가져오기
    const getCmttwo = (cmts) => {
        let times = cmts.length;

        if (cmts.length > 2) {
            times = 2;
        }
        let sumCmt = ``;
        for (let i = 0; i < times; i++) {
            let oneCmt = cmts[1];
            console.log(oneCmt);
            let cmtHtml =
                /*html*/
                `<p>
                    <a class="art_account" href="/${oneCmt.coUserid}">${oneCmt.coUserid}</a>
                    <span>&nbsp;${oneCmt.coText}</span>
                </p>`;
            sumCmt += cmtHtml;
        }
        return sumCmt;
    };

    const getEle = async () => {
        if (window.scrollY + 1000 > document.getElementById("feed_roll").offsetHeight) {
            try {
                if (pending) {
                    return;
                }
                pending = true;
                const response = await axios.post("./GetContentsServlet", "start=" + start);

                const newthing = response.data;
                for (let i = 0; i < newthing.result.length; i++) {
                    let one_article = newthing.result[i];
                    let cmts = getCmttwo(one_article.comment);
                    //   console.log(cmts);
                    let strHtml =
                        /*html*/
                        `<div class="main_article">
                                <div class="article_header">
                                    <div class="art_header_img">
                                        <a class="off_story" href="#">
                                            <a class="on_story" href="">
                                                <img
                                                    src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/101066874_250369176291217_8457202342863831040_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=MIG0PVCGXmkAX_nqjce&oh=340b25f50b734ba354cb0dd7ee994921&oe=5F1DC758"
                                                    alt=""
                                                />
                                            </a>
                                        </a>
                                    </div>
                                    <div class="art_header_account">
                                        <a href="#"><p class="art_account">${one_article.account}</p></a>
                                    </div>
                                    <div class="art_header_opt"><a href="">···</a></div>
                                </div>
                                <div class="img_container">
                                    <img src="${one_article.img ? one_article.img : "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"}" alt="" />
                                </div>
                                <div class="article_content">
                                    <div class="art_content_btns">
                                        <img class="con_btnLike" src="./images/emptyheart.png" alt="" />
                                        <img class="con_btnCmt" src="./images/comment.png" alt="" />
                                        <img class="con_btnShare" src="./images/share.png" alt="" />
                                        <img class="con_btnSave" src="./images/emptysave.png" alt="" />
                                    </div>
                                    <div class="art_content_likes">
                                        <a href=""><span class="con_likes">좋아요 <span class="con_cntlikes">${one_article.like}</span>개</span></a>
                                    </div>
                                    <div class="art_content_summary">
                                        <p>
                                            <a class="art_account" href=""><span>${one_article.account}</span></a>
                                            <span>&nbsp;${getTaglink(one_article.content)}</span>
                                        </p>
                                        <div>
                                            <div><a class="see_allCmt">댓글 2,032개 모두 보기</a></div>
                                            ${cmts}
                                            <p><a class="art_con_time" href="">5시간 전</a></p>
                                        </div>
                                    </div>
                                    <div class="art_content_insert">
                                        <textarea aria-label="댓글 달기..." autocomplete="off" autocorrect="off" class="art_con_cmt" placeholder="댓글 달기..."></textarea>
                                        <button class="art_btnSubmitCmt" type="submit">게시</button>
                                    </div>
                                </div>
                            </div>`;

                    let doc = document.createElement("div");
                    doc.innerHTML = strHtml;
                    let newArticle = doc.firstChild;
                    document.getElementById("feed_box").appendChild(newArticle);
                    setbtnActions(newArticle, one_article.idx, one_article.islikeon, one_article.issaveon, one_article.like);
                }
                start += 5;
            } catch (e) {
                console.log(e);
            } finally {
                pending = false;
            }
        }
    };

    getEle();
    window.addEventListener("scroll", getEle, true);

    // 위젯 회전목마
    (() => {
        let rShift = 0;
        $(".nav_btnNext").on("click", function () {
            if (rShift < 478) rShift +=98;
            $(".wget_hot_carousel .carousel_imgs").css("right", rShift + "px");
        });
    })();
});
