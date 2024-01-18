function shuffleElements(parent1) {
    for (var i = parent1.children.length; i >= 0; i--) {
        parent1.appendChild(parent1.children[Math.random() * i | 0]);
    }
}
var myList1 = document.getElementById('myList1');
shuffleElements(myList1);

function shuffleElements1(parent) {
    var lista=parent.children.length;
    for (var i = lista; i >= 0; i--) {
        parent.appendChild(parent.children[Math.random() * i | 0]);
    }
}
var myList2 = document.getElementById('myList2');
shuffleElements(myList2);
