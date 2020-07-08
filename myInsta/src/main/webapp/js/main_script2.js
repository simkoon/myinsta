
$(() => {
    let start = 0;
    let pending = false;
    
    const setbtnActions = function (newArticle) {
        $(newArticle)
            .find(".con_btnLike")
            .on("click", function () {
                if ($(this).attr("src") == "./images/heart.png") {
                    $(this).attr("src", "./images/emptyheart.png");
                } else {
                    $(this).attr("src", "./images/heart.png");
                }
            });
        $(newArticle)
            .find(".con_btnSave")
            .on("click", function () {
                if ($(this).attr("src") == "./images/save.png") {
                    $(this).attr("src", "./images/emptysave.png");
                } else {
                    $(this).attr("src", "./images/save.png");
                }
            });
    };

    const getEle = async () => {
        if (window.scrollY + 1000 > document.getElementById("feed_roll").offsetHeight) {
            try {
                if (pending) {
                    return;
                }
                pending = true;
                const response = await axios.post("./ArticleSearch", "start=" + start);

                const newthing = response.data;
                for (let i = 0; i < newthing.result.length; i++) {
                    let one_article = newthing.result[i];

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
                                        <a href="#"><p class="art_account">account</p></a>
                                    </div>
                                    <div class="art_header_opt"><a href="">···</a></div>
                                </div>
                                <div class="img_container">
                                    <img src="${one_article.img ? one_article.img : "https://i.imgur.com/DPfWlY0.png"}" alt="" />
                                </div>
                                <div class="article_content">
                                    <div class="art_content_btns">
                                        <img class="con_btnLike" src="./images/emptyheart.png" alt="" />
                                        <img class="con_btnCmt" src="./images/comment.png" alt="" />
                                        <img class="con_btnShare" src="./images/share.png" alt="" />
                                        <img class="con_btnSave" src="./images/emptysave.png" alt="" />
                                    </div>
                                    <div class="art_content_likes">
                                        <a href=""><span class="con_likes">좋아요 000,000개</span></a>
                                    </div>
                                    <div class="art_content_summary">
                                        <p>
                                            <a class="art_account" href=""><span>account</span></a>
                                            <span>&nbsp;${one_article.content}</span>
                                        </p>
                                        <div>
                                            <div><a class="see_allCmt">댓글 2,032개 모두 보기</a></div>
                                            <p>
                                                <a class="art_account" href="">myname</a>
                                                <span>&nbsp;eodododo</span>
                                            </p>
                                            <p>
                                                <a class="art_account" href="">hihih_ujjugu</a>
                                                <span>&nbsp;eodododo</span>
                                            </p>
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
                    setbtnActions(newArticle);
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
});