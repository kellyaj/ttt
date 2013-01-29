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
    printer.print_board(board)
  end
end
