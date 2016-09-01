class PostMailer < ApplicationMailer
	default from: "minamikase0301@icloud.com"

	def post_email(user)
   		mail to: user.email, subject: "[IDEANOTE]新規登録確認のお知らせ"
	end
end
