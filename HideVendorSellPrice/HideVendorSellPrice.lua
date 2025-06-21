local function HideVendorSellPrice(tooltip)
    if not tooltip.shownMoneyFrames then
        return
    end

    for i = 1, tooltip.shownMoneyFrames do
        local moneyFrame = _G[tooltip:GetName() .. "MoneyFrame" .. i]
        if moneyFrame then
            moneyFrame:Hide()
            MoneyFrame_SetType(moneyFrame, "STATIC")
        end
    end

    tooltip.shownMoneyFrames = nil
end

TooltipDataProcessor.AddLinePreCall(Enum.TooltipDataLineType.SellPrice, function(tooltip, lineData)
    HideVendorSellPrice(tooltip)
    return true
end)
