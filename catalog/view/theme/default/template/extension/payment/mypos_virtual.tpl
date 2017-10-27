<form name="mypos_virtual" action="<?php echo $action; ?>" method="post">
    <?php foreach ($post as $name => $value): ?>
        <input type="hidden" name="<?php echo $name; ?>" value="<?php echo htmlspecialchars($value); ?>">
    <?php endforeach; ?>
</form>

<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" onclick="document.mypos_virtual.submit();" />
    </div>
</div>