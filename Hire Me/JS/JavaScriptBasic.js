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
    try {
        if (args.Value[0] == '0' && args.Value[1] == '9' || args.Value[0] == '0' && args.Value[1] == '1' && args.Value[2] == '1') {
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