local DlgTemplate = DlgTemplate
local GameApi = GameApi
local DlgApi  = DlgApi

Win_CharDelete = DlgTemplate:new({this = "Win_CharDelete"})

function Win_CharDelete:Init()
	self:RegisterEvent("Btn_FaceBook",
					   function()
							print("Btn_FaceBook")
							GameApi.CaptureScreen()
					   		os.execute("start iexplore.exe https://www.facebook.com/notes/%E7%AC%91%E5%82%B2%E6%B1%9F%E6%B9%96online/%E5%A6%82%E4%BD%95%E5%88%86%E4%BA%AB%E6%8D%8F%E8%87%89%E8%A7%92%E8%89%B2%E5%A4%96%E8%A7%80%E6%95%99%E5%AD%B8/204195073101785")
					   end
					  );
end

