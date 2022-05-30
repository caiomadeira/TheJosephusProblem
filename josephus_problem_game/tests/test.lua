
-- return multiples values

function test_MultiReturn()
    a = "Test A"
    b = "Test B"
    return a, b
end


-- run test function
function main()

    print(test_MultiReturn())

end

main()