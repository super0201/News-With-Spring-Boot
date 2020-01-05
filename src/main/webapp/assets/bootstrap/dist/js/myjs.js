
 // thêm dấu 3 chấm nếu  quá dài
 $(".note").each(function () { 
    if ($(this).text().length > 50) { $(this).text($(this).text().substr(0, 200)); $(this).append('...'); } 
    });
    // comment tự động resize
    // var observe;
    // if (window.attachEvent) {
    //     observe = function (element, event, handler) {
    //         element.attachEvent(''+event, handler);
    //     };
    // }
    // else {
    //     observe = function (element, event, handler) {
    //         element.addEventListener(event, handler, false);
    //     };
    // }
    // function init () {
    //     var text = document.getElementById('comment-edit');
    //     function resize () {
    //         text.style.height = 'auto';
    //         text.style.height = text.scrollHeight+'px';
    //     }
    //     /* 0-timeout to get the already changed text */
    //     function delayedResize () {
    //         window.setTimeout(resize, 0);
    //     }
    //     observe(text, 'change',  resize);
    //     observe(text, 'cut',     delayedResize);
    //     observe(text, 'paste',   delayedResize);
    //     observe(text, 'drop',    delayedResize);
    //     observe(text, 'keydown', delayedResize);
    
    //     text.focus();
    //     text.select();
    //     resize();
    // }
    // auto resize 2 
    $('#comment-edit').each(function () {
        this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
      }).on('input', function () {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
      });
    
    /// sự kiện trả lời comment
    $(".comment-rep").ready(function(){
        $(".btnReplr").click(function(){
          $(".comment-rep").toggle();
        });
      });