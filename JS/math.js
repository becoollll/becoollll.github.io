function cal() {
    var a = document.getElementById('up').value;
    var b = document.getElementById('down').value;
    var result = combinator(a, b);
    function fac(n){
        if (n <= 1)
            return 1;
        else
            return n * fac(n - 1);
    }
    function combinator(n, m){
        return fac(n) / (fac(m) * fac(n - m));
    }
    result = "ans = " + result;
    document.getElementById('answer').innerHTML = result;
}