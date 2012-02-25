module ExtendedNestedSet
  module InstanceMethods

    def is_first_of_siblings?(parent = nil)
      if parent
        parent.lft == self.lft - 1
      else
        left_sibling.nil?
      end
    end

    def is_last_of_siblings?(parent = nil)
      if parent
        parent.rgt == self.rgt + 1
      else
        right_sibling.nil?
      end
    end

    def move_lower
      move_to_right_of(right_sibling) unless is_last_of_siblings?
    end

    def move_higher
      move_to_left_of left_sibling unless is_first_of_siblings?
    end

    def move_to_bottom
      move_to_right_of siblings.last unless is_last_of_siblings?
    end

    def move_to_top
      move_to_left_of siblings.first unless is_first_of_siblings?
    end

  end
end
