count = 1;
function like(boxId) {
    var img_link1 = document.getElementById('img');
    var print1 = document.querySelector('#count');
    // var object1 = document.getElementById(`${boxId[boxId.length-1]}`);
    // object1.textContent = counts[boxId];

    if (count >= 0) {
        img_link1.src = './img/btn_like2.png';
        print1.innerHTML = `${count}`;
        count++;
    }
    
    // if (count == 0) {
    //     count++;
    //     img_link1.src = './img/btn_like2.png';
    //     print1.innerHTML = `${count}`;
    // } else {
    //     count--;
    //     img_link1.src = './img/btn_like1.png';
    //     print1.innerHTML = `${count}`;
    // }
}