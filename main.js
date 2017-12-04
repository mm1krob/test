$(document).ready(function(){
    $('button').click(function () {
        let user = {};
        for (let i = 0; i < 4; i++) {
            user[document.forms[0].elements[i].name] = document.forms[0].elements[i].value;
        }
        user = JSON.stringify(user);
       emailValidAndSet(document.forms[0].elements.email.value, user);
    });
    showUsers();

    function showUsers () {
        for (let key in localStorage){
            let person = JSON.parse(localStorage.getItem(key));
            if(person.full_name=="")person.full_name='нема імені'
            $('tbody').append(`<tr><td>${person.full_name}</td> <td>${person.email}</td></tr>`);
        }
    }

    function emailValidAndSet(email, user){
        if(email != '') {
            let pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if(!pattern.test(email)){
                $('[name="email"]').css({'border' : '1px solid #ff0000'});
                $('span, span br').remove();
                $('[name="email"]').after('<span><br />неправильний емейл</span>');
                $('span').css('color','red');
            }else if(email in localStorage){
                $('span, span br').remove();
                $($('[name="email"]')).after('<span><br />такий користувач вже є, введіть інше імя</span>');
                $('span').css('color','red');

            }
             else{
                localStorage.setItem(document.forms[0].elements.email.value , user);
                $('span, span br').remove();
                $('[name="email"]').css({'border' : '1px solid grey'});
                document.forms[0].reset();
            }
        }
    };
});
