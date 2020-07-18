const gettagid = (str) => {
    const emptyFilter = (arrs) => {
        return arrs.filter(function (item) {
            return item !== null && item !== undefined && item !== "";
        });
    };

    str = str.split(" ");
    let strmap = /*html*/ ``;
    str.map((x) => {
        if (x.includes("@")) {
            if (x.indexOf("@") != 0) {
                let notTag = x.trim().split("@");
                notTag = emptyFilter(notTag);
                notTag[0] = null;
                notTag = emptyFilter(notTag);
                console.log(notTag);
                for (str2 of notTag) {
                    strmap += "@" + str2 + ",";
                }
                return;
            }
            if (x.match(/@/g).length > 1) {
                console.log(x.indexOf("@"));
                let sphash = x.trim().split("@");

                sphash = emptyFilter(sphash);

                for (strel of sphash) {
                    strmap += "@" + strel + ",";
                }

                return;
            }

            strmap += x + ",";
            return;
        }
    });
    return strmap;
};
let str = "@dklsfsd";
console.log(gettagid(str));
