function up -d "My package"
    # Package entry-point
    set levels 1
    set query 0

    for arg in $argv
        switch $arg
            case "-q"
                set query 1
            case '*'
                set levels $arg
        end
    end

    set path $PWD
    for i in (seq $levels)
        set path "$path/.."
    end

    set path (realpath $path)

    if test $query -eq 1
        echo $path
    else
        cd $path
    end
end
