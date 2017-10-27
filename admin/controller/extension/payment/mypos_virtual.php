<?php
class ControllerExtensionPaymentMyposVirtual extends Controller {

    public function index() {
        // Load language
        $this->load->language('extension/payment/mypos_virtual');

        // Load settings
        $this->load->model('setting/setting');

        // Set document title
        $this->document->setTitle($this->language->get('heading_title'));

        if (isset($this->session->data['success']))
        {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        // If isset request to change settings
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

            // Default values

            if ($this->request->post['mypos_virtual_developer_url'] == null)
            {
                $this->request->post['mypos_virtual_developer_url'] = 'https://www.mypos.eu/vmp/checkout-test';
            }

            if ($this->request->post['mypos_virtual_production_url'] == null)
            {
                $this->request->post['mypos_virtual_production_url'] = 'https://www.mypos.eu/vmp/checkout';
            }

            // Edit settings
            $this->model_setting_setting->editSetting('mypos_virtual', $this->request->post);

            // Set success message
            $this->session->data['success'] = $this->language->get('text_success');

            // Return to extensions page
            $this->response->redirect($this->url->link('extension/payment/mypos_virtual', 'token=' . $this->session->data['token'], 'SSL'));
        }

        // Load default layout
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        // Load language variables
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_mypos_join'] = $this->language->get('text_mypos_join');
        $data['help_total'] = $this->language->get('help_total');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        // Field entries
        $data['entry_status']			   = $this->language->get('entry_status');
        $data['entry_test']		           = $this->language->get('entry_test');
        $data['entry_sid']				   = $this->language->get('entry_sid');
        $data['entry_wallet_number']	   = $this->language->get('entry_wallet_number');
        $data['entry_private_key']		   = $this->language->get('entry_private_key');
        $data['entry_public_certificate']  = $this->language->get('entry_public_certificate');
        $data['entry_developer_keyindex']  = $this->language->get('entry_developer_keyindex');
        $data['entry_production_keyindex'] = $this->language->get('entry_production_keyindex');
        $data['entry_developer_url']	   = $this->language->get('entry_developer_url');
        $data['entry_production_url']	   = $this->language->get('entry_production_url');
        $data['entry_sort_order']  	       = $this->language->get('entry_sort_order');
        $data['entry_logging']  	       = $this->language->get('entry_logging');

        // Tooltips
        $data['tooltip_sid'] = $this->language->get('tooltip_sid');
        $data['tooltip_wallet_number'] = $this->language->get('tooltip_wallet_number');
        $data['tooltip_private_key'] = $this->language->get('tooltip_private_key');
        $data['tooltip_public_certificate'] = $this->language->get('tooltip_public_certificate');
        $data['tooltip_keyindex'] = $this->language->get('tooltip_keyindex');

        // Load breadcrumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_payment'),
            'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('payment/cod', 'token=' . $this->session->data['token'], 'SSL')
        );

        // Load action buttons urls
        $data['action'] = $this->url->link('extension/payment/mypos_virtual', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

        // Set default values for fields

        // Status of payment module Enabled/Disabled
        if (isset($this->request->post['mypos_virtual_status'])) {
            $data['mypos_virtual_status'] = $this->request->post['mypos_virtual_status'];
        } else {
            $data['mypos_virtual_status'] = $this->config->get('mypos_virtual_status');
        }

        // Logging Enabled/Disabled
        if (isset($this->request->post['mypos_virtual_logging'])) {
            $data['mypos_virtual_logging'] = $this->request->post['mypos_virtual_logging'];
        } else {
            $data['mypos_virtual_logging'] = $this->config->get('mypos_virtual_logging');
        }

        // Sort order
        if (isset($this->request->post['mypos_virtual_sort_order'])) {
            $data['mypos_virtual_sort_order'] = $this->request->post['mypos_virtual_sort_order'];
        } else {
            $data['mypos_virtual_sort_order'] = $this->config->get('mypos_virtual_sort_order');
        }

        // Test / Production
        if (isset($this->request->post['mypos_virtual_test'])) {
            $data['mypos_virtual_test'] = $this->request->post['mypos_virtual_test'];
        } else {
            $data['mypos_virtual_test'] = $this->config->get('mypos_virtual_test');
        }

        // Site ID
        if (isset($this->request->post['mypos_virtual_developer_sid'])) {
            $data['mypos_virtual_developer_sid'] = $this->request->post['mypos_virtual_developer_sid'];
        } else {
            $data['mypos_virtual_developer_sid'] = $this->config->get('mypos_virtual_developer_sid');
        }

        // Wallet number
        if (isset($this->request->post['mypos_virtual_developer_wallet_number'])) {
            $data['mypos_virtual_developer_wallet_number'] = $this->request->post['mypos_virtual_developer_wallet_number'];
        } else {
            $data['mypos_virtual_developer_wallet_number'] = $this->config->get('mypos_virtual_developer_wallet_number');
        }

        // Private key
        if (isset($this->request->post['mypos_virtual_developer_private_key'])) {
            $data['mypos_virtual_developer_private_key'] = trim($this->request->post['mypos_virtual_developer_private_key']);
        } else {
            $data['mypos_virtual_developer_private_key'] = trim($this->config->get('mypos_virtual_developer_private_key'));
        }

        // Public certificate
        if (isset($this->request->post['mypos_virtual_developer_public_certificate'])) {
            $data['mypos_virtual_developer_public_certificate'] = trim($this->request->post['mypos_virtual_developer_public_certificate']);
        } else {
            $data['mypos_virtual_developer_public_certificate'] = trim($this->config->get('mypos_virtual_developer_public_certificate'));
        }

        // Developer url
        if (isset($this->request->post['mypos_virtual_developer_url'])) {
            $data['mypos_virtual_developer_url'] = $this->request->post['mypos_virtual_developer_url'];
        } else {
            $data['mypos_virtual_developer_url'] = $this->config->get('mypos_virtual_developer_url');
        }

        // Developer keyindex
        if (isset($this->request->post['mypos_virtual_developer_keyindex'])) {
            $data['mypos_virtual_developer_keyindex'] = $this->request->post['mypos_virtual_developer_keyindex'];
        } else {
            $data['mypos_virtual_developer_keyindex'] = $this->config->get('mypos_virtual_developer_keyindex');
        }

        // Site ID
        if (isset($this->request->post['mypos_virtual_production_sid'])) {
            $data['mypos_virtual_production_sid'] = $this->request->post['mypos_virtual_production_sid'];
        } else {
            $data['mypos_virtual_production_sid'] = $this->config->get('mypos_virtual_production_sid');
        }

        // Wallet number
        if (isset($this->request->post['mypos_virtual_production_wallet_number'])) {
            $data['mypos_virtual_production_wallet_number'] = $this->request->post['mypos_virtual_production_wallet_number'];
        } else {
            $data['mypos_virtual_production_wallet_number'] = $this->config->get('mypos_virtual_production_wallet_number');
        }

        // Private key
        if (isset($this->request->post['mypos_virtual_production_private_key'])) {
            $data['mypos_virtual_production_private_key'] = trim($this->request->post['mypos_virtual_production_private_key']);
        } else {
            $data['mypos_virtual_production_private_key'] = trim($this->config->get('mypos_virtual_production_private_key'));
        }

        // Public certificate
        if (isset($this->request->post['mypos_virtual_production_public_certificate'])) {
            $data['mypos_virtual_production_public_certificate'] = trim($this->request->post['mypos_virtual_production_public_certificate']);
        } else {
            $data['mypos_virtual_production_public_certificate'] = trim($this->config->get('mypos_virtual_production_public_certificate'));
        }

        // Production url
        if (isset($this->request->post['mypos_virtual_production_url'])) {
            $data['mypos_virtual_production_url'] = $this->request->post['mypos_virtual_production_url'];
        } else {
            $data['mypos_virtual_production_url'] = $this->config->get('mypos_virtual_production_url');
        }

        // Production keyindex
        if (isset($this->request->post['mypos_virtual_production_keyindex'])) {
            $data['mypos_virtual_production_keyindex'] = $this->request->post['mypos_virtual_production_keyindex'];
        } else {
            $data['mypos_virtual_production_keyindex'] = $this->config->get('mypos_virtual_production_keyindex');
        }

        // Default values

        if ($data['mypos_virtual_developer_url'] == null)
        {
            $data['mypos_virtual_developer_url'] = 'https://www.mypos.eu/vmp/checkout-test';
        }

        if ($data['mypos_virtual_developer_keyindex'] == null)
        {
            $data['mypos_virtual_developer_keyindex'] = '1';
        }

        if ($data['mypos_virtual_production_url'] == null)
        {
            $data['mypos_virtual_production_url'] = 'https://www.mypos.eu/vmp/checkout';
        }

        if ($data['mypos_virtual_production_keyindex'] == null)
        {
            $data['mypos_virtual_production_keyindex'] = '1';
        }

        $this->response->setOutput($this->load->view('extension/payment/mypos_virtual.tpl', $data));
    }
}