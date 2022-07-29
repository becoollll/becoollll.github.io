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
        var temp;
        if (n < m) {
            temp = n;
            n = m;
            m = temp;
        }
        return fac(n) / (fac(m) * fac(n - m));
    }
    result = "ans = " + result;
    document.getElementById('answer').innerHTML = result;
}