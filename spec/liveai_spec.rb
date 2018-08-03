RSpec.describe Liveai do
	it "send test" do
		q = Liveai::Query.new
		q.send("{data:age: 33,category: 2},label: {bought: 1}}")
		expect(q.result).not_to eq(nil)
	end
end
