function regData(regType, idx) {
    for (let i = 0; i < document.getElementsByName('reg_type').length; i++) {
        document.getElementsByName('reg_type')[i].value = regType;
    }
    document.getElementById(idx).submit();
}