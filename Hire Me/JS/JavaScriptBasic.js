function validateLengthPwrd(sender, args) {
    debugger;
    if (args.Value.length >= 15) {
        return args.IsValid = true;
    }
    else {
        return args.IsValid = false;
    }
}
function validateStartPhe(sender, args) {
    debugger;
    try {
        if (args.Value[0] === '0' && args.Value[1] === '9' || args.Value[0] === '0' && args.Value[1] === '1' && args.Value[2] === '1') {
            return args.IsValid = true;
        }
        else {
            return args.IsValid = false;
        }
    }
    catch {
        return args.IsValid = false;
    }
}
function validateGmail(sender, args) {
    debugger;
    let cnt = 0;
    for (let i = 0; i < args.Value.length; i++) {
        if (args.Value[i] === '@' && args.Value[i + 1] !== '.') {
            for (var j = i; j < args.Value.length; j++) {
                if (args.Value[j] === '.' && args.Value[args.Value.length - 1] !== args.Value[j]) {
                    cnt++;
                }
            }
            if (cnt === 1) {
                try {
                    if (args.Value[i + 1] === 'g' && args.Value[i + 2] === 'm'
                        && args.Value[i + 3] === 'a' && args.Value[i + 4] === 'i' && args.Value[i + 5] === 'l'
                        && args.Value[i + 6] === '.' && args.Value[i + 7] === 'c' && args.Value[i + 8] === 'o'
                        && args.Value[i + 9] === 'm') {
                        return args.IsValid = true;
                    }
                    else {
                        return args.IsValid = false;
                    }
                }
                catch
                {
                    return args.IsValid = false;
                }
            }
        }
    }
}
function myFunction() {
    var x = document.getElementById("theAccount");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}