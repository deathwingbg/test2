<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-cod" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
	    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_mypos_join; ?>
		    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    </div>

        <?php if (isset($error_warning) && $error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if (isset($success) && $success) { ?>
            <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cod" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="mypos_virtual_status" id="input-status" class="form-control">
                                <?php if ($mypos_virtual_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-test"><?php echo $entry_test; ?></label>
                        <div class="col-sm-10">
                            <select name="mypos_virtual_test" id="input-test" class="form-control">
                                <?php if ($mypos_virtual_test) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-logging"><?php echo $entry_logging; ?></label>
                        <div class="col-sm-10">
                            <select name="mypos_virtual_logging" id="input-logging" class="form-control">
                                <?php if ($mypos_virtual_logging) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="mypos_virtual_sort_order" value="<?php echo $mypos_virtual_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                        </div>
                    </div>

                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" <?php if ($mypos_virtual_test) { ?> class="active" <?php } ?> style="padding-left: 117px;"><a href="#developer" aria-controls="home" role="tab" data-toggle="tab">Developer</a></li>
                            <li role="presentation" <?php if (!$mypos_virtual_test) { ?> class="active" <?php } ?>><a href="#production" aria-controls="profile" role="tab" data-toggle="tab">Production</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane <?php if ($mypos_virtual_test) { ?> active <?php } ?>" id="developer">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-sid"><span data-toggle="tooltip" title="<?php echo $tooltip_sid; ?>"><?php echo $entry_sid; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_developer_sid" value="<?php echo $mypos_virtual_developer_sid; ?>" placeholder="<?php echo $entry_sid; ?>" id="input-developer-sid" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-wallet-number"><span data-toggle="tooltip" title="<?php echo $tooltip_wallet_number; ?>"><?php echo $entry_wallet_number; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_developer_wallet_number" value="<?php echo $mypos_virtual_developer_wallet_number; ?>" placeholder="<?php echo $entry_wallet_number; ?>" id="input-developer-wallet-number" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-private-key"><span data-toggle="tooltip" title="<?php echo $tooltip_private_key; ?>"><?php echo $entry_private_key; ?></label>
                                    <div class="col-sm-10">
                                        <textarea id="input-developer-private-key" name="mypos_virtual_developer_private_key" class="form-control" rows="15"><?php
                                            echo $mypos_virtual_developer_private_key;
                                        ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-public-certificate"><span data-toggle="tooltip" title="<?php echo $tooltip_public_certificate; ?>"><?php echo $entry_public_certificate; ?></label>
                                    <div class="col-sm-10">
                            <textarea id="input-developer-public-certificate" name="mypos_virtual_developer_public_certificate" class="form-control" rows="11"><?php
                                echo $mypos_virtual_developer_public_certificate;
                            ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-url"><?php echo $entry_developer_url; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_developer_url" value="<?php echo $mypos_virtual_developer_url; ?>" placeholder="<?php echo $entry_developer_url; ?>" id="input-developer-url" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-developer-keyindex"><span data-toggle="tooltip" title="<?php echo $tooltip_keyindex; ?>"><?php echo $entry_developer_keyindex; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_developer_keyindex" value="<?php echo $mypos_virtual_developer_keyindex; ?>" placeholder="<?php echo $entry_developer_keyindex; ?>" id="input-developer-keyindex" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane <?php if (!$mypos_virtual_test) { ?> active <?php } ?>" id="production">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-sid"><span data-toggle="tooltip" title="<?php echo $tooltip_sid; ?>"><?php echo $entry_sid; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_production_sid" value="<?php echo $mypos_virtual_production_sid; ?>" placeholder="<?php echo $entry_sid; ?>" id="input-production-sid" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-wallet-number"><span data-toggle="tooltip" title="<?php echo $tooltip_wallet_number; ?>"><?php echo $entry_wallet_number; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_production_wallet_number" value="<?php echo $mypos_virtual_production_wallet_number; ?>" placeholder="<?php echo $entry_wallet_number; ?>" id="input-production-wallet-number" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-private-key"><span data-toggle="tooltip" title="<?php echo $tooltip_private_key; ?>"><?php echo $entry_private_key; ?></label>
                                    <div class="col-sm-10">
                            <textarea id="input-production-private-key" name="mypos_virtual_production_private_key" class="form-control" rows="15"><?php
                                echo $mypos_virtual_production_private_key;
                            ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-public-certificate"><span data-toggle="tooltip" title="<?php echo $tooltip_public_certificate; ?>"><?php echo $entry_public_certificate; ?></label>
                                    <div class="col-sm-10">
                            <textarea id="input-production-public-certificate" name="mypos_virtual_production_public_certificate" class="form-control" rows="11"><?php
                                echo $mypos_virtual_production_public_certificate;
                            ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-url"><?php echo $entry_production_url; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_production_url" value="<?php echo $mypos_virtual_production_url; ?>" placeholder="<?php echo $entry_production_url; ?>" id="input-production-url" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-production-keyindex"><span data-toggle="tooltip" title="<?php echo $tooltip_keyindex; ?>"><?php echo $entry_production_keyindex; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mypos_virtual_production_keyindex" value="<?php echo $mypos_virtual_production_keyindex; ?>" placeholder="<?php echo $entry_production_keyindex; ?>" id="input-production-keyindex" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?> 