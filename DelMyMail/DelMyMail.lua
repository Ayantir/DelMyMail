function MAIL_INBOX:Delete()
	if self.mailId then
		if self:IsMailDeletable() then
			local attachments, gold = GetMailAttachmentInfo(self.mailId)
			
			self.pendingDelete = true
			if attachments > 0 and gold > 0 then
				ZO_Dialogs_ShowDialog("DELETE_MAIL_ATTACHMENTS_AND_MONEY")
			elseif attachments > 0 then
				ZO_Dialogs_ShowDialog("DELETE_MAIL_ATTACHMENTS")
			elseif gold > 0 then
				ZO_Dialogs_ShowDialog("DELETE_MAIL_MONEY")
			else
				self:ConfirmDelete(self.mailId)
			end
		end
	end
end