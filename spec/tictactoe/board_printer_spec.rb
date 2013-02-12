require 'spec_helper'
describe BoardPrinter do

  let (:output) {output = double('output').as_null_object}

  it "should print the board" do
    board = [1,2,3,4,5,6,7,8,9]
    printer = BoardPrinter.new(output)
    output.should_receive(:puts).with("    " + [1,2,3].join("   |   "))
    output.should_receive(:puts).with("   " + "-------------------")
    output.should_receive(:puts).with("    " + [4,5,6].join("   |   "))
    output.should_receive(:puts).with("   " + "-------------------")
    output.should_receive(:puts).with("    " + [7,8,9].join("   |   "))
    printer.print_board(board, 3, 3)
  end

  it "should print the board that is 4x4" do
    board = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    printer = BoardPrinter.new(output)
    output.should_receive(:puts).with("    " + [1,2,3,4].join("   |   "))
    output.should_receive(:puts).with("   " + "-------------------")
    output.should_receive(:puts).with("    " + [5,6,7,8].join("   |   "))
    output.should_receive(:puts).with("   " + "-------------------")
    output.should_receive(:puts).with("    " + [9,10,11,12].join("   |   "))
    output.should_receive(:puts).with("   " + "-------------------")
    output.should_receive(:puts).with("    " + [13,14,15,16].join("   |   "))
    printer.print_board(board, 4, 4)
  end

end
