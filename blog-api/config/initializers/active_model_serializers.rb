Rails.logger.info 'Disable root globally for in ArraySerializer'
ActiveModel::ArraySerializer.root = false
