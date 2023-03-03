window.addEventListener('message', function (event) {
    if (event.data.msg == "Open") {
        $("body").css({ 'display': 'block' }).animate({
            opacity: '100%'
        })
    }
    if (event.data.msg == "Close") {
        $("body").css({ 'display': 'none' }).animate({
            opacity: '0%'
        })
    }
    if (event.data.msg == "Data") {
        $.each(event.data.Shop, function (index, devo) {
            const devoJuicing =
                `
            <div class="cocktails" id="${index}">
                <div class="Image" style=" background-image: url('/src/Assets/Images/${devo.Item}.png')"></div>
                <p class="Item">${devo.Label}</p>
                <p class="Price">$${devo.Price}</p>
            </div>   
            `
            $('.cocktails-A').append(devoJuicing);
            $('#' + index).data("devo2", devo);
        })
    }
});

var audioPlayer = null;

$(document).on('click', '.cocktails', function () {
    const ID = $(this).attr('id');
    const Data00 = $('#' + ID).data("devo2");
    $.post('https://devo-juicingMachine/Buy', JSON.stringify({Price: Data00.Price, Item: Data00.Item}))

    if (audioPlayer != null) {
        audioPlayer.pause();
      }
      audioPlayer = new Audio("./doldurmaefekti.ogg");
      audioPlayer.volume = 0.2;
      audioPlayer.play();
});

$(document).on("keydown", function(event) {
    switch (event.keyCode) {
        case 27: // ESC
        $.post('https://devo-juicingMachine/Close2', JSON.stringify({}))
        break;
    }
});