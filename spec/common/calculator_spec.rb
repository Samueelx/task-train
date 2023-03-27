require_relative '../../app/models/calculator'

RSpec.describe("Calculator functionality") do
    context 'numerical operations' do
        it 'should add two numbers correctly' do
            calc = Calculator.new(n1: 10, n2: 300)
            expect(calc.add).to eql(310)
        end
    end
end