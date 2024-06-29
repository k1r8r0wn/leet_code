# 2. Add Two Numbers
#
#
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in
# reverse order, and each of their nodes contains a single digit.
# Add the two numbers and return the sum as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Example 1:
#
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.
#
# Example 2:
#
# Input: l1 = [0], l2 = [0]
# Output: [0]
# Example 3:
#
# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]
#
# Constraints:
#
# The number of nodes in each linked list is in the range [1, 100].
# 0 <= Node.val <= 9
# It is guaranteed that the list represents a number that does not have leading zeros.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, next_val = nil)
    @val = val
    @next = next_val
  end
end

def add_two_numbers(l1, l2)
  dummy_head = ListNode.new(0) # Create a dummy head for the result list
  current = dummy_head # Current node for building the result list
  carry = 0 # Carry variable

  while l1 || l2 || carry.positive?
    sum = carry

    # Add the values from l1 and l2 if they are not nil
    sum += l1.val if l1
    sum += l2.val if l2

    carry = sum / 10 # Calculate the carry
    current.next = ListNode.new(sum % 10) # Create a new node with the digit sum
    current = current.next # Move the current pointer

    # Move to the next nodes in the input lists if they exist
    l1 = l1&.next
    l2 = l2&.next
  end

  dummy_head.next # Return the result list (excluding the dummy head)
end

# def add_two_numbers2(l1, l2, carry = 0)
#   sum = carry + (l1&.val || 0) + (l2&.val || 0)
#   val = sum % 10
#   carry = sum / 10

#   return ListNode.new(val, add_two_numbers(l1&.next, l2&.next, carry)) if l1&.next || l2&.next || carry != 0

#   ListNode.new(val)
# end

# Create the input lists
l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next&.next = ListNode.new(3)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next&.next = ListNode.new(4)

# Call the function and print the result
result = add_two_numbers(l1, l2)

# Iterate through the result list and print the values
while result
  print result.val
  print ' -> ' if result.next
  result = result.next
end
