const emailcheck = () => {
    let emailadressarea = document.querySelector(".emailadressarea");
    let emailInput = document.querySelector(".email");
    let emailMessage = document.querySelector(".emailMessage");
    let emailInput1 = document.querySelector(".email").value.indexOf("@" && ".");

    if (emailInput1 === -1) {
        emailadressarea.style.color = 'red';
        emailInput.style.borderBottom = '1px solid red'
        emailMessage.innerHTML = "이메일 주소를 정확히 입력해주세요.";
    } else {
        emailadressarea.style.color = '';
        emailInput.style.borderBottom = ''
        emailMessage.innerHTML = "";
    }
};

const pwdcheck = () => {
    let passwordarea = document.querySelector(".passwordarea");
    let passwordInput = document.querySelector(".password");
    let passwordMessage = document.querySelector(".passwordMessage");
    regExp = /^[a-z0-9!@#$%^]{8,15}/i;
    if (!regExp.test(passwordInput.value)) {
        passwordarea.style.color = 'red';
        passwordInput.style.borderBottom = '1px solid red'
        passwordMessage.innerHTML = "영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)";
    } else {
        passwordarea.style.color = '';
        passwordInput.style.borderBottom = ''
        passwordMessage.innerHTML = "";
    }
}

const validate = () => {
    let loginbtn = document.getElementsByClassName("loginbtn")[0];
    let passwordInput = document.querySelector(".password");
    let emailInput = document.querySelector(".email");

    if (emailInput.value == "" && passwordInput.value == "") {
        loginbtn.disabled = true;
    } else {
        loginbtn.disabled = false;
        loginbtn.style.backgroundColor = "black";
        loginbtn.style.color = 'white';
        loginbtn.style.cursor = 'pointer';
    }
};

const clickEvent = () => {
    let loginbtn = document.getElementsByClassName("loginbtn")[0];
    let passwordInput = document.querySelector(".password");
    let emailInput = document.querySelector(".email");
    alert("회원가입 완료 ~ ^*^");
    emailInput.value = "";
    passwordInput.value = "";
    loginbtn.disabled = true;
    loginbtn.style.backgroundColor = "";
    loginbtn.style.color = 'white';
    loginbtn.style.cursor = 'default';
} 

// $('.email').on('input', checkInput);
// $('.password').on('input', checkInput);

// // input 입력 시에 checkInput 함수실행
// function checkInput() {
    //   var idCheck = $('.email').val();   // idCheck 변수
    //   var passwordCheck = $('.password').val();   // idCheck 변수
    //   var btnLogin = $('.loginbtn');

    //   if (idCheck === '' || passwordCheck === '') {
        //     // 기본 로그인 버튼 색상
        //     btnLogin.removeClass('on');
        //   } else {
            //     // ID 비밀번호 입력 시에 로그인 버튼 배경색 변경
            //     btnLogin.addClass('on');
            //   }
            // }

            

// let emailInput = document.querySelector(".email"), passwordInput = document.querySelector(".password");
// const loginBtn = document.getElementsByClassName('loginbtn');


// const isActiveLogin = () => {
//     let emailValue = emailInput.value;
//     let pwdValue = passwordInput.value;

//     if (
//         (emailValue && pwdValue) &&
//         (pwdValue.length >= 8) &&
//         (emailValue.includes('@', '.'))
//     ) {
//         loginBtn.disabled = false;
//         loginbtn.style.backgroundColor = "black";
//         loginbtn.style.color = 'white';
//         loginBtn.style.cursor = 'pointer';
//     }
//     else {
//         loginBtn.disabled = true;
//     }
// }


// function moveToMain(){
//     location.replace("../home.html");
// }
// let emailInput = document.querySelector(".email");
// let passwordInput = document.querySelector(".password");
// let loginbtn = document.getElementsByClassName("loginbtn")[0];

// emailInput.addEventListener('keyup', validate());
// passwordInput.addEventListener('keyup', validate());
// loginbtn.addEventListener('click',moveToMain());