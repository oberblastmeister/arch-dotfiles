function fuzzy_finding#rg_and_replace()
    write!

    let s:word = expand("<cword>")
    execute "Rg" s:word

    let replace = ""
    let replace = input("Replace with: ")

    if replace != ""

      let mode = ""
      let mode = input("Mode: ")

      if mode != ""
        execute "%s/" . s:word . "/" . replace . "/" . mode
      else
        echo "canceled"
      endif
    else
      echo "canceled"
    endif
endfunction
